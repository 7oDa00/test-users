# Test Users

The application displays a list of a group of users, and when you click on any item in the list, details of the user data appear.

## dependencies
cupertino_icons: ^1.0.2
get: ^4.6.5
http: ^1.1.0
flutter_svg: ^2.0.9

### API Reference

#### Get all users

```http
  GET /api/users
```

#### Get specific user details

```http
  GET /api/users/${id}
```

| Parameter | Type     | Description                                  |
| :-------- | :------- |:---------------------------------------------|
| `id`      | `string` | **Required**. Id of user to fetch details of |

#### Screenshots

![1](https://github.com/7oDa00/test-users/assets/127032324/66bf76f0-9a80-4634-8f5f-b4831b848249)
![2](https://github.com/7oDa00/test-users/assets/127032324/646b7124-7d7c-416b-b176-0199a1c2d26a)
![3](https://github.com/7oDa00/test-users/assets/127032324/8067ce4f-f3b3-4280-9b1d-4f54da0181be)



