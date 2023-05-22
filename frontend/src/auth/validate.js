import axios from 'axios';
import { ref } from 'vue';

import removeItem from './removeItem';

const error = ref(null);

const validate = async () => {
  error.value = null;

  const uid = window.localStorage.getItem('uid');
  const client = window.localStorage.getItem('client');
  const accessToken = window.localStorage.getItem('access-token');

  try {
    const res = await axios.get('http://localhost:8000/auth/validate_token', {
      headers: {
        uid: uid,
        'access-token': accessToken,
        client: client,
      },
    });

    if (!res) {
      throw new Error('Failed authorize');
    }

    return res;
  } catch (err) {
    error.value = 'Failed authorize';
    removeItem();
  }
};

const useValidate = () => {
  return { error, validate };
};

export default useValidate;
